package domain;

public class Certificate {

   private String certi_num;
   private String certi_name;
   private String certi_category;
   private String certi_year;
   private String certi_rnd;
   private String certi_outline;
   private String certi_instt;
   private String certi_instt_url;
   private String certi_fee;
   private String certi_acq_mthd;
   private String certi_qlf;
   private String certi_related;
   private String certi_testId_issue_start_date;
   private String certi_testId_issue_end_date;
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
   private int certi_bookmark_cnt;
   
   
   public Certificate(String certi_name, String certi_outline) {
      super();
      this.certi_name = certi_name;
      this.certi_outline = certi_outline;
   }

   
   public Certificate(String certi_name, String certi_year, String certi_rnd, String certi_outline, String certi_instt,
		String certi_instt_url) {
	super();
	this.certi_name = certi_name;
	this.certi_year = certi_year;
	this.certi_rnd = certi_rnd;
	this.certi_outline = certi_outline;
	this.certi_instt = certi_instt;
	this.certi_instt_url = certi_instt_url;
}



public Certificate(String certi_name, String certi_outline, String certi_instt, String certi_instt_url,
		String certi_fee, String certi_testId_issue_start_date, String certi_testId_issue_end_date,
		String certi_hndw_rcp_start_date, String certi_hndw_rcp_end_date, String certi_hndw_test_start_date,
		String certi_hndw_test_end_date) {
	super();
	this.certi_name = certi_name;
	this.certi_outline = certi_outline;
	this.certi_instt = certi_instt;
	this.certi_instt_url = certi_instt_url;
	this.certi_fee = certi_fee;
	this.certi_testId_issue_start_date = certi_testId_issue_start_date;
	this.certi_testId_issue_end_date = certi_testId_issue_end_date;
	this.certi_hndw_rcp_start_date = certi_hndw_rcp_start_date;
	this.certi_hndw_rcp_end_date = certi_hndw_rcp_end_date;
	this.certi_hndw_test_start_date = certi_hndw_test_start_date;
	this.certi_hndw_test_end_date = certi_hndw_test_end_date;
}


public Certificate(String certi_num, String certi_name, String certi_category, String certi_year, String certi_rnd,
         String certi_outline, String certi_instt, String certi_instt_url, String certi_fee, String certi_acq_mthd,
         String certi_qlf, String certi_related, String certi_testId_issue_start_date,
         String certi_testId_issue_end_date, String certi_hndw_rcp_start_date, String certi_hndw_rcp_end_date,
         String certi_hndw_test_start_date, String certi_hndw_test_end_date, String certi_hndw_pass_start_date,
         String certi_hndw_pass_end_date, String certi_doc_submit_start_date, String certi_doc_submit_end_date,
         String certi_prctc_rcp_start_date, String certi_prctc_rcp_end_date, String certi_prctc_test_start_date,
         String certi_prctc_test_end_date, String certi_final_pass_start_date, String certi_final_pass_end_date,
         int certi_bookmark_cnt) {
      super();
      this.certi_num = certi_num;
      this.certi_name = certi_name;
      this.certi_category = certi_category;
      this.certi_year = certi_year;
      this.certi_rnd = certi_rnd;
      this.certi_outline = certi_outline;
      this.certi_instt = certi_instt;
      this.certi_instt_url = certi_instt_url;
      this.certi_fee = certi_fee;
      this.certi_acq_mthd = certi_acq_mthd;
      this.certi_qlf = certi_qlf;
      this.certi_related = certi_related;
      this.certi_testId_issue_start_date = certi_testId_issue_start_date;
      this.certi_testId_issue_end_date = certi_testId_issue_end_date;
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
      this.certi_bookmark_cnt = certi_bookmark_cnt;
   }
   
   public String getCerti_num() {
      return certi_num;
   }
   public void setCerti_num(String certi_num) {
      this.certi_num = certi_num;
   }
   public String getCerti_name() {
      return certi_name;
   }
   public void setCerti_name(String certi_name) {
      this.certi_name = certi_name;
   }
   public String getCerti_category() {
      return certi_category;
   }
   public void setCerti_category(String certi_category) {
      this.certi_category = certi_category;
   }
   public String getCerti_year() {
      return certi_year;
   }
   public void setCerti_year(String certi_year) {
      this.certi_year = certi_year;
   }
   public String getCerti_rnd() {
      return certi_rnd;
   }
   public void setCerti_rnd(String certi_rnd) {
      this.certi_rnd = certi_rnd;
   }
   public String getCerti_outline() {
      return certi_outline;
   }
   public void setCerti_outline(String certi_outline) {
      this.certi_outline = certi_outline;
   }
   public String getCerti_instt() {
      return certi_instt;
   }
   public void setCerti_instt(String certi_instt) {
      this.certi_instt = certi_instt;
   }
   public String getCerti_instt_url() {
      return certi_instt_url;
   }
   public void setCerti_instt_url(String certi_instt_url) {
      this.certi_instt_url = certi_instt_url;
   }
   public String getCerti_fee() {
      return certi_fee;
   }
   public void setCerti_fee(String certi_fee) {
      this.certi_fee = certi_fee;
   }
   public String getCerti_acq_mthd() {
      return certi_acq_mthd;
   }
   public void setCerti_acq_mthd(String certi_acq_mthd) {
      this.certi_acq_mthd = certi_acq_mthd;
   }
   public String getCerti_qlf() {
      return certi_qlf;
   }
   public void setCerti_qlf(String certi_qlf) {
      this.certi_qlf = certi_qlf;
   }
   public String getCerti_related() {
      return certi_related;
   }
   public void setCerti_related(String certi_related) {
      this.certi_related = certi_related;
   }
   public String getCerti_testId_issue_start_date() {
      return certi_testId_issue_start_date;
   }
   public void setCerti_testId_issue_start_date(String certi_testId_issue_start_date) {
      this.certi_testId_issue_start_date = certi_testId_issue_start_date;
   }
   public String getCerti_testId_issue_end_date() {
      return certi_testId_issue_end_date;
   }
   public void setCerti_testId_issue_end_date(String certi_testId_issue_end_date) {
      this.certi_testId_issue_end_date = certi_testId_issue_end_date;
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
   public int getCerti_bookmark_cnt() {
      return certi_bookmark_cnt;
   }
   public void setCerti_bookmark_cnt(int certi_bookmark_cnt) {
      this.certi_bookmark_cnt = certi_bookmark_cnt;
   }
   
    
                                                                                                                                                                                                            
}

