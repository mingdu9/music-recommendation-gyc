package BeansHome;

import DAO.DBOracleMgr;
import DAO.ExceptionMgr;


public class BeanMottoRecommendDTO {

    public int inRecommendId = 0;
    public int inFrequency = 0;
    public String inTitle = null;
    public String inArtist = null;
    public String inUserId = null;
    public String inLink = null;
    public String inNation = null;
    public String inGenre = null;
    public String inSeason = null;
    public String inTimezone = null;
    public String inCircum = null;

    //------------------------------------------------

    public DBOracleMgr DBMgr = null;

    //------------------------------------------------

    public BeanMottoRecommendDTO() {
        try {
            ExceptionMgr.SetMode(ExceptionMgr.RUN_MODE.DEBUG);

            this.DBMgr = new DBOracleMgr();
            this.DBMgr.SetConnectionString("172.24.210.162", 1521, "motto", "0000", "XE");
            //this.DBMgr.SetConnectionString("172.24.233.15", 1521, "mymotto", "0000", "XE");
            //this.DBMgr.SetConnectionString("192.168.0.4", 1521, "mymotto", "0000", "XE");

        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);
        }
    }

    //--------------------------------------------------

    // getter, setter

    /***********************************************************************
     * selectRecommend() : 해당 id 추천 레코드 읽기, history에 해당 기록 추가
     * @param void : None
     * @return void : None
     ***********************************************************************/
    public boolean selectRecommend() {
        String sSql = null;                        // DML 문장
        Object[] oPaValue = null;                // DML 문장에 필요한 파라미터 객체
        boolean bResult = false;

        try {
            if (this.DBMgr.DbConnect()) {
                //if (this.rdoGender != null && this.cmbDept != null)
                {
                    sSql = "{ CALL select_recommend(?,?) }";

                    // IN 파라미터 만큼만 할당
                    oPaValue = new Object[1];

                    oPaValue[0] = this.inRecommendId;

                    if (this.DBMgr.RunQuery(sSql, oPaValue, 2, true)) {
                        if (this.DBMgr.Rs.next())
                            bResult = true;
                    }

                }
            }
            // -----------------------------------------------------------------------------
        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return bResult;
    }

    /***********************************************************************
     * insertRecommend() : 해당 추천 삽입하고 삽입된 추천 id 반환, history에 해당 기록 추가
     * @param void : None
     * @return void : None
     ***********************************************************************/
    public boolean insertRecommend() {
        String sSql = null;                        // DML 문장
        Object[] oPaValue = null;                // DML 문장에 필요한 파라미터 객체
        boolean bResult = false;

        try {
            if (this.DBMgr.DbConnect()) {
                //if (this.rdoGender != null && this.cmbDept != null)
                {
                    // 사원정보 읽기
                    sSql = "BEGIN insert_recommend(?,?,?,?,?,?,?,?,?,?,?); END;";

                    // IN 파라미터 만큼만 할당
                    oPaValue = new Object[10];

                    oPaValue[0] = this.inTitle;
                    oPaValue[1] = this.inArtist;
                    oPaValue[2] = this.inUserId;
                    oPaValue[3] = this.inLink;
                    oPaValue[4] = this.inNation;
                    oPaValue[5] = this.inGenre;
                    oPaValue[6] = this.inSeason;
                    oPaValue[7] = this.inTimezone;
                    oPaValue[8] = this.inCircum;
                    oPaValue[9] = this.inFrequency;

                    if (this.DBMgr.RunProcedure(sSql, oPaValue, 11)) {
                        if (this.DBMgr.DbCommit())
                            bResult = true;
                        System.out.println("ok");
                    }
                }
            }
            // -----------------------------------------------------------------------------
        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return bResult;
    }

    /***********************************************************************
     * getRecommend() : 일치율 60퍼 이상 되는거 && 국가 코드 일치하는 노래 리스트 출력
     * @param void : None
     * @return void : None
     ***********************************************************************/
    public boolean getRecommend() {
        String sSql = null;                        // DML 문장
        Object[] oPaValue = null;                // DML 문장에 필요한 파라미터 객체
        boolean bResult = false;

        try {
            if (this.DBMgr.DbConnect()) {
                //if (this.rdoGender != null && this.cmbDept != null)
                {
                    // 사원정보 읽기
                    sSql = "BEGIN get_recommend(?,?,?,?,?,?); END;";

                    // IN 파라미터 만큼만 할당
                    oPaValue = new Object[5];

                    oPaValue[0] = this.inNation;
                    oPaValue[1] = this.inGenre;
                    oPaValue[2] = this.inSeason;
                    oPaValue[3] = this.inTimezone;
                    oPaValue[4] = this.inCircum;

                    if (this.DBMgr.RunQuery(sSql, oPaValue, 6, true)) {
                        bResult = true;
                        System.out.println("ok");
                    }
                }
            }
            // -----------------------------------------------------------------------------
        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return bResult;
    }

    public boolean insertHistory() {
        String sSql = null;                        // DML 문장
        Object[] oPaValue = null;                // DML 문장에 필요한 파라미터 객체
        boolean bResult = false;

        try {
            if (this.DBMgr.DbConnect()) {
                //if (this.rdoGender != null && this.cmbDept != null)
                {
                    sSql = "{ CALL insert_history(?,?) }";

                    // IN 파라미터 만큼만 할당
                    oPaValue = new Object[2];

                    oPaValue[0] = this.inUserId;
                    oPaValue[1] = this.inRecommendId;

                    if (this.DBMgr.RunQuery(sSql, oPaValue, 0, false)) {
                        if (this.DBMgr.DbCommit()) {
                            bResult = true;
                        }
                    }
                }
            }
            // -----------------------------------------------------------------------------
        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return bResult;
    }

    public boolean addFrequency() {
        String sSql = null;                        // DML 문장
        Object[] oPaValue = null;                // DML 문장에 필요한 파라미터 객체
        boolean bResult = false;

        try {
            if (this.DBMgr.DbConnect()) {
                //if (this.rdoGender != null && this.cmbDept != null)
                {
                    sSql = "{ CALL add_frequency(?) }";

                    // IN 파라미터 만큼만 할당
                    oPaValue = new Object[1];

                    oPaValue[0] = this.inRecommendId;

                    if (this.DBMgr.RunQuery(sSql, oPaValue, 0, false)) {
                        if (this.DBMgr.DbCommit()) {
                            bResult = true;
                        }
                    }
                }
            }
            // -----------------------------------------------------------------------------
        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return bResult;
    }

    public boolean getRecentHistory(String isSent) {
        String sSql = null;                        // DML 문장
        Object[] oPaValue = null;                // DML 문장에 필요한 파라미터 객체
        boolean bResult = false;

        try {
            if (this.DBMgr.DbConnect()) {
                //if (this.rdoGender != null && this.cmbDept != null)
                {
                    // 사원정보 읽기
                    sSql = "BEGIN get_recent_history(?,?); END;";

                    // IN 파라미터 만큼만 할당
                    oPaValue = new Object[1];

                    oPaValue[0] = isSent;

                    if (this.DBMgr.RunQuery(sSql, oPaValue, 2, true)) {
                        bResult = true;
                    }
                }
            }
            // -----------------------------------------------------------------------------
        } catch (Exception Ex) {
            ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return bResult;
    }
}
