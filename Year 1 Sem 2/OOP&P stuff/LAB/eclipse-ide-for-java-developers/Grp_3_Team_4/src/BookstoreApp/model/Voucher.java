package BookstoreApp.model;

import java.io.Serializable;

public class Voucher implements Serializable{
	
	private static final long serialVersionUID = 7299925609279175361L;

	private String code;
	
	private int used;//0 is for unused vouchers and 1 is for used vouchers
	
	private double discountValue;
	
	public Voucher() {
		
	}
	
	public Voucher(String code, int used, double discountValue) {
		this.code = code;
		this.used = used;
		this.discountValue = discountValue;
	}

	public double getDiscountValue() {
		return discountValue;
	}

	public void setDiscountValue(double discountValue) {
		this.discountValue = discountValue;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}
}
