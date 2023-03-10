package BookstoreApp.model;

public class OrderedItem extends Item{
	
	private static final long serialVersionUID = -8767880278687495254L;
	
	private int itemQuantity;
	
	public OrderedItem() {
		
	}
	
	public OrderedItem(String name, double price, int itemQuantity) {
		super(name,price);
		this.itemQuantity = itemQuantity;
	}
	
	public int getItemQuantity() {
		return itemQuantity;
	}

	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
}
