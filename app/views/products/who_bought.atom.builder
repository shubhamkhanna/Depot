@product = Product.find(params[:id])

atom_feed do |feed|
  feed.title "who bought #{@product.title}"

  latest_order = @product.orders.sort_by(&:updated_at).last
  feed.updated( latest_order && latest_order.updated_at)

  total = 0

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "order #{order.id}"
      entry.summary :type => "xhtml" do |xhtml|
        xhtml.p "shipped to #{order.address}"

        
        xhtml.table do
          xhtml.tr do
            xhtml.th "Product"
            xhtml.th "Quantity"
            xhtml.th "Total Price"
          end
          
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              total += (item.product.price * item.quantity)
              xhtml.td item.product.price
            end
            
            xhtml.tr do
              xhtml.td "Total Price"
              xhtml.td total
            end
          end
        end

        xhtml.p "Paid by #{order.pay_type}"
      end

      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end