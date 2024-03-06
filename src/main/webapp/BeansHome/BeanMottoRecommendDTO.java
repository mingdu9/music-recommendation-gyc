package BeansHome;

public class BeanMottoRecommendDTO {

	//변수 선언
	//------------------------------------------------
	
	public DAO.DBOracleMgr DBMgr = null;
	
	//------------------------------------------------
	
	public BeanMottoRecommendDTO() {
		try {
			DAO.ExceptionMgr.SetMode(DAO.ExceptionMgr.RUN_MODE.DEBUG);
			
			this.DBMgr = new DAO.DBOracleMgr();
			this.DBMgr.SetConnectionString("172.24.210.162", 1521, "motto", "0000", "XE");
			
		} catch (Exception Ex) {
			DAO.ExceptionMgr.DisplayException(Ex);
		}
	}

	//--------------------------------------------------
	
	
	
	/***********************************************************************
	 * ReadInfo() : 디비 연결 테스트용
	 * @param void : None
	 * @return void : None
	 ***********************************************************************/
	public boolean ReadInfo()
	{
		String sSql = null;						// DML 문장
		Object[] oPaValue = null;				// DML 문장에 필요한 파라미터 객체
		boolean bResult = false;
		
		try
		{
	    	// -----------------------------------------------------------------------------
			// 사원정보 읽기
	    	// -----------------------------------------------------------------------------
			if (this.DBMgr.DbConnect() == true)
			{
				//if (this.rdoGender != null && this.cmbDept != null)
				{
					// 사원정보 읽기
					sSql = "BEGIN SP_MAN_R(?,?,?,?); END;";
					sSql = "SELECT * FROM REC_HISTORIES";
					
					// IN 파라미터 만큼만 할당
					//oPaValue = new Object[3];
					
//					oPaValue[0] = this.txtAge;
//					oPaValue[1] = this.rdoGender;
//					oPaValue[2] = this.cmbDept;
					
					if (this.DBMgr.RunQuery(sSql, oPaValue, 0, true) == true)
					{
						bResult = true;
					}
				}
			}
	    	// -----------------------------------------------------------------------------
		}
		catch (Exception Ex)
		{
			DAO.ExceptionMgr.DisplayException(Ex);		// 예외처리(콘솔)
		}
		
		return bResult;
	}
	
}
