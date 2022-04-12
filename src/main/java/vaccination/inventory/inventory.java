package vaccination.inventory;

public class inventory {
	
	private String batch_no;
	private String vaccine_name;
	private String receive_date;
	private String country;
	private String expire_date;
	private int quantity;
	
	public inventory(String batch_no, String vaccine_name, String receive_date, String country, String expire_date, int quantity) {
		this.batch_no = batch_no;
		this.vaccine_name = vaccine_name;
		this.receive_date = receive_date;
		this.country = country;
		this.expire_date = expire_date;
		this.quantity = quantity;
	}
	 
	 
	public String getBatch_no() {
		return batch_no;
	}
	public String getVaccine_name() {
		return vaccine_name;
	}
	public String getReceive_date() {
		return receive_date;
	}
	public String getCountry() {
		return country;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public int getQuantity() {
		return quantity;
	}
	 
	 

	 

}
