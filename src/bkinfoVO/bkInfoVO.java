package bkinfoVO;

import java.util.Date;

public class bkInfoVO {


	private int BKNUM;
	private Date CHKIN;
	private Date CHKOUT;
	private String RMTYPE;
	private String FIRSTNAME;
	private String LASTNAME;
	private int HEADCNT;
	private String TEL;
	private int MEMNUM;
	public int getBKNUM() {
		return BKNUM;
	}
	public void setBKNUM(int bKNUM) {
		BKNUM = bKNUM;
	}
	public Date getCHKIN() {
		return CHKIN;
	}
	public void setCHKIN(Date cHKIN) {
		CHKIN = cHKIN;
	}
	public Date getCHKOUT() {
		return CHKOUT;
	}
	public void setCHKOUT(Date cHKOUT) {
		CHKOUT = cHKOUT;
	}
	public String getRMTYPE() {
		return RMTYPE;
	}
	public void setRMTYPE(String rMTYPE) {
		RMTYPE = rMTYPE;
	}
	public String getFIRSTNAME() {
		return FIRSTNAME;
	}
	public void setFIRSTNAME(String fIRSTNAME) {
		FIRSTNAME = fIRSTNAME;
	}
	public String getLASTNAME() {
		return LASTNAME;
	}
	public void setLASTNAME(String lASTNAME) {
		LASTNAME = lASTNAME;
	}
	public int getHEADCNT() {
		return HEADCNT;
	}
	public void setHEADCNT(int hEADCNT) {
		HEADCNT = hEADCNT;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public int getMEMNUM() {
		return MEMNUM;
	}
	public void setMEMNUM(int mEMNUM) {
		MEMNUM = mEMNUM;
	}
	public bkInfoVO(int bKNUM, Date cHKIN, Date cHKOUT, String rMTYPE, String fIRSTNAME, String lASTNAME, int hEADCNT,
			String tEL, int mEMNUM) {
		super();
		BKNUM = bKNUM;
		CHKIN = cHKIN;
		CHKOUT = cHKOUT;
		RMTYPE = rMTYPE;
		FIRSTNAME = fIRSTNAME;
		LASTNAME = lASTNAME;
		HEADCNT = hEADCNT;
		TEL = tEL;
		MEMNUM = mEMNUM;
	}
	@Override
	public String toString() {
		return "bkInfoVO [BKNUM=" + BKNUM + ", CHKIN=" + CHKIN + ", CHKOUT=" + CHKOUT + ", RMTYPE=" + RMTYPE
				+ ", FIRSTNAME=" + FIRSTNAME + ", LASTNAME=" + LASTNAME + ", HEADCNT=" + HEADCNT + ", TEL=" + TEL
				+ ", MEMNUM=" + MEMNUM + "]";
	}

	

	
	
}
