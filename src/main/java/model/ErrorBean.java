package model;

public class ErrorBean {
	private String error;

	public ErrorBean(String error) {
		super();
		this.error = error;
	}
	

	public ErrorBean() {
		super();
	}


	public String getError() {
		return (error != null)?error:"";
	}

	public void setError(String error) {
		this.error = error;
	}
	
}
