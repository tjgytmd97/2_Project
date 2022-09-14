package domain;

public class Bookrmark {
	private String mark_num;
	private String certi_name;
	private String certi_hndw_rcp_start_date;
	private String certi_hndw_rcp_end_date;
	private String certi_hndw_test_start_date;
	private String certi_hndw_test_end_date;
	private String certi_hndw_pass_start_date;
	private String certi_hndw_pass_end_date;
	private String certi_doc_submit_start_date;
	private String certi_doc_submit_end_date;
	private String certi_prctc_rcp_start_date;
	private String certi_prctc_rcp_end_date;
	private String certi_prctc_test_start_date;
	private String certi_prctc_test_end_date;
	private String certi_final_pass_start_date;
	private String certi_final_pass_end_date;
	private String certi_num;
	private String member_num;
	
	
	
	public Bookrmark(String certi_name) {
		super();
		this.certi_name = certi_name;
	}

	public Bookrmark(String mark_num, String certi_name, String certi_hndw_rcp_start_date,
			String certi_hndw_rcp_end_date, String certi_hndw_test_start_date, String certi_hndw_test_end_date,
			String certi_hndw_pass_start_date, String certi_hndw_pass_end_date, String certi_doc_submit_start_date,
			String certi_doc_submit_end_date, String certi_prctc_rcp_start_date, String certi_prctc_rcp_end_date,
			String certi_prctc_test_start_date, String certi_prctc_test_end_date, String certi_final_pass_start_date,
			String certi_final_pass_end_date, String certi_num, String member_num) {
		super();
		this.mark_num = mark_num;
		this.certi_name = certi_name;
		this.certi_hndw_rcp_start_date = certi_hndw_rcp_start_date;
		this.certi_hndw_rcp_end_date = certi_hndw_rcp_end_date;
		this.certi_hndw_test_start_date = certi_hndw_test_start_date;
		this.certi_hndw_test_end_date = certi_hndw_test_end_date;
		this.certi_hndw_pass_start_date = certi_hndw_pass_start_date;
		this.certi_hndw_pass_end_date = certi_hndw_pass_end_date;
		this.certi_doc_submit_start_date = certi_doc_submit_start_date;
		this.certi_doc_submit_end_date = certi_doc_submit_end_date;
		this.certi_prctc_rcp_start_date = certi_prctc_rcp_start_date;
		this.certi_prctc_rcp_end_date = certi_prctc_rcp_end_date;
		this.certi_prctc_test_start_date = certi_prctc_test_start_date;
		this.certi_prctc_test_end_date = certi_prctc_test_end_date;
		this.certi_final_pass_start_date = certi_final_pass_start_date;
		this.certi_final_pass_end_date = certi_final_pass_end_date;
		this.certi_num = certi_num;
		this.member_num = member_num;
	}

	public String getMark_num() {
		return mark_num;
	}

	public void setMark_num(String mark_num) {
		this.mark_num = mark_num;
	}

	public String getCerti_name() {
		return certi_name;
	}

	public void setCerti_name(String certi_name) {
		this.certi_name = certi_name;
	}

	public String getCerti_hndw_rcp_start_date() {
		return certi_hndw_rcp_start_date;
	}

	public void setCerti_hndw_rcp_start_date(String certi_hndw_rcp_start_date) {
		this.certi_hndw_rcp_start_date = certi_hndw_rcp_start_date;
	}

	public String getCerti_hndw_rcp_end_date() {
		return certi_hndw_rcp_end_date;
	}

	public void setCerti_hndw_rcp_end_date(String certi_hndw_rcp_end_date) {
		this.certi_hndw_rcp_end_date = certi_hndw_rcp_end_date;
	}

	public String getCerti_hndw_test_start_date() {
		return certi_hndw_test_start_date;
	}

	public void setCerti_hndw_test_start_date(String certi_hndw_test_start_date) {
		this.certi_hndw_test_start_date = certi_hndw_test_start_date;
	}

	public String getCerti_hndw_test_end_date() {
		return certi_hndw_test_end_date;
	}

	public void setCerti_hndw_test_end_date(String certi_hndw_test_end_date) {
		this.certi_hndw_test_end_date = certi_hndw_test_end_date;
	}

	public String getCerti_hndw_pass_start_date() {
		return certi_hndw_pass_start_date;
	}

	public void setCerti_hndw_pass_start_date(String certi_hndw_pass_start_date) {
		this.certi_hndw_pass_start_date = certi_hndw_pass_start_date;
	}

	public String getCerti_hndw_pass_end_date() {
		return certi_hndw_pass_end_date;
	}

	public void setCerti_hndw_pass_end_date(String certi_hndw_pass_end_date) {
		this.certi_hndw_pass_end_date = certi_hndw_pass_end_date;
	}

	public String getCerti_doc_submit_start_date() {
		return certi_doc_submit_start_date;
	}

	public void setCerti_doc_submit_start_date(String certi_doc_submit_start_date) {
		this.certi_doc_submit_start_date = certi_doc_submit_start_date;
	}

	public String getCerti_doc_submit_end_date() {
		return certi_doc_submit_end_date;
	}

	public void setCerti_doc_submit_end_date(String certi_doc_submit_end_date) {
		this.certi_doc_submit_end_date = certi_doc_submit_end_date;
	}

	public String getCerti_prctc_rcp_start_date() {
		return certi_prctc_rcp_start_date;
	}

	public void setCerti_prctc_rcp_start_date(String certi_prctc_rcp_start_date) {
		this.certi_prctc_rcp_start_date = certi_prctc_rcp_start_date;
	}

	public String getCerti_prctc_rcp_end_date() {
		return certi_prctc_rcp_end_date;
	}

	public void setCerti_prctc_rcp_end_date(String certi_prctc_rcp_end_date) {
		this.certi_prctc_rcp_end_date = certi_prctc_rcp_end_date;
	}

	public String getCerti_prctc_test_start_date() {
		return certi_prctc_test_start_date;
	}

	public void setCerti_prctc_test_start_date(String certi_prctc_test_start_date) {
		this.certi_prctc_test_start_date = certi_prctc_test_start_date;
	}

	public String getCerti_prctc_test_end_date() {
		return certi_prctc_test_end_date;
	}

	public void setCerti_prctc_test_end_date(String certi_prctc_test_end_date) {
		this.certi_prctc_test_end_date = certi_prctc_test_end_date;
	}

	public String getCerti_final_pass_start_date() {
		return certi_final_pass_start_date;
	}

	public void setCerti_final_pass_start_date(String certi_final_pass_start_date) {
		this.certi_final_pass_start_date = certi_final_pass_start_date;
	}

	public String getCerti_final_pass_end_date() {
		return certi_final_pass_end_date;
	}

	public void setCerti_final_pass_end_date(String certi_final_pass_end_date) {
		this.certi_final_pass_end_date = certi_final_pass_end_date;
	}

	public String getCerti_num() {
		return certi_num;
	}

	public void setCerti_num(String certi_num) {
		this.certi_num = certi_num;
	}

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	
}
