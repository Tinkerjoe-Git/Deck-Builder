module CardsHelper
    def fields_for_helper(f)
        if @collection
            f.hidden_field :collection_id, value: @collection.id 
        else 
            render partial: "fields_for", locals: {f: f}  
        end 

    end
    
    def index_header
        if @collection 
            content_tag(:h1, "#{@collection} cards")
        else 
            content_tag(:h1, "All Cards")
        end 
    end    
end
