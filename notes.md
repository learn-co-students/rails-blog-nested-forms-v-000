[] We need to change the permitted params in our PostsController to accept another attribute, :tags_attributes, which contains the tag attributes that we need to create a new tag

[] We also need an accepts_nested_attributes_for macro on our Post model, which will permit tags to be nested in our new Post form

[] Build a nested form in our Post form

[] We should be able to select previously created tags as well as create a new tag