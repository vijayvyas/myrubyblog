ActiveAdmin.register_page "Dashboard" do

	menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
	content title: proc{ I18n.t("active_admin.dashboard") } do
    
	section "Recent Posts" do
			table_for Post.order("id desc").limit(15) do
				column :id
				column "Post Title", :title do |post|
					link_to post.title, [:admin, post]
				end
				column :category, :sortable => :category
				column :created_at
			end
			strong (link_to "Show All Post", :admin_posts)
		end

		section "Categories" do
			table_for Category.order("id desc").limit(15) do
				column :id
				column "Category Title", :name do |category|
					link_to category.name, [:admin, category]
				end
				column :created_at
			end
			strong (link_to "Show All Category", :admin_categories)
		end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
