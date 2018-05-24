require_relative 'feature_helper'

feature 'Delete comments', %q(
  I want to manage comments
) do
  given(:user) { create(:user) }
  given(:admin) { create(:user, :admin) }
  given(:another_user) { create(:user) }
  given(:post) { create(:post, user: user) }
  given!(:comment) { create(:comment, post: post, user: user) }

  context 'Unauthenticated user' do
    scenario 'Unauthenticated user tries to delete comment', js: true do
      visit post_path(post)
      within '.comments' do
        expect(page).to_not have_link t('titles.comments.delete')
      end
    end
  end

  context 'Authenticated user' do
    context 'when his comment' do
      background do
        login_as(user, scope: :user, run_callbacks: false)
        visit post_path(post)
      end

      scenario "sees '#{t('titles.comments.delete')}' link" do
        within '.comments' do
          expect(page).to have_link t('titles.comments.delete')
        end
      end

      scenario 'tries to delete', js: true do
        click_on t('titles.comments.delete')

        within '.comments' do
          expect(page).to_not have_content comment.text
        end
      end
    end

    context "when other user's comment" do
      background do
        login_as(another_user, scope: :user, run_callbacks: false)
        visit post_path(post)
      end

      scenario 'tries to edit' do
        within '.comments' do
          expect(page).to_not have_link t('titles.comments.delete')
        end
      end
    end
  end

  context 'Admin user' do
    context 'multiple sessions' do
      scenario "comment appears on another user's page", js: true do
        Capybara.using_session('user') do
          login_as(admin, scope: :user, run_callbacks: false)
          visit post_path(post)
          expect(page).to have_content comment.text
        end

        Capybara.using_session('guest') do
          visit post_path(post)
          expect(page).to have_content comment.text
        end

        Capybara.using_session('user') do
          expect do
            click_on t('titles.comments.delete')
            sleep 1
          end.to change(post.comments, :count).by(-1)
        end

        Capybara.using_session('guest') do
          expect(page).to_not have_content comment.text
        end
      end
    end

    context "when other user's comment" do
      background do
        login_as(admin, scope: :user, run_callbacks: false)
        visit post_path(post)
      end

      scenario 'tries to delete', js: true do
        click_on t('titles.comments.delete')

        within '.comments' do
          expect(page).to_not have_content comment.text
        end
      end
    end
  end
end
