<h1>確認画面</h1>
  <%= form_with(model: @post, url: posts_path,local: true) do |form| %>
    <%= image_tag(@user.image.url) if @user.image && @feed.image.url %>
    <%= form.hidden_field :image_cache %>
    <%= form.label :コメント %>
    <%= form.hidden_field :content %>
    <%= @feed.content%>
    <br>
    <%= form.submit "投稿する",class: 'btn btn-default' %>
  <% end %>

  <%= form_with(model:@post, url:new_post_path, local:true, method:"get") do |form| %>
    <%= form.hidden_field :image_cache %>
    <%= form.hidden_field :content %>
    <%= form.submit "戻る", name: "back" %>
  <% end %>
</section>