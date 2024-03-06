package BeansHome;

import DAO.ExceptionMgr;

public class BeanMottoUserDTO {

    //변수 선언
    //------------------------------------------------

    // signup page jsp-----------------------------------
    public String signUpId;
    public String signUpPassword;
    // -------------------------------------------------
    // signin page jsp ---------------------------------
    public String signInId;
    public String signInPassword;
    // -------------------------------------------------
    // withdraw page jsp -------------------------------
    public String withdrawId;
    // -------------------------------------------------
    // update password page jsp ------------------------
    public String updatePasswordId;
    public String updatePassword;
    // -------------------------------------------------
    // my page -> select recommends by user id ---------
    public String selectId;
    // -------------------------------------------------
    public String recommendId;

    public DAO.DBOracleMgr DBMgr = null;

    //------------------------------------------------

    public BeanMottoUserDTO() {
        try {
            DAO.ExceptionMgr.SetMode(DAO.ExceptionMgr.RUN_MODE.DEBUG);

            this.DBMgr = new DAO.DBOracleMgr();
            this.DBMgr.SetConnectionString("172.24.210.162", 1521, "motto", "0000", "XE");
            //this.DBMgr.SetConnectionString("172.24.233.15", 1521, "mymotto", "0000", "XE");
            //this.DBMgr.SetConnectionString("192.168.0.4", 1521, "mymotto", "0000", "XE");

        } catch (Exception Ex) {
            DAO.ExceptionMgr.DisplayException(Ex);
        }
    }

    //--------------------------------------------------

    public boolean signUp() {
        boolean result = false;
        Object[] parameters;
        String sql;
        try {
            if (this.DBMgr.DbConnect()) {
                {
                    sql = "{ CALL CREATE_USER(?, ?, ?) }";

                    // IN 파라미터 만큼만 할당
                    parameters = new Object[2];

                    parameters[0] = signUpId;
                    parameters[1] = signUpPassword;

                    if (this.DBMgr.RunProcedure(sql, parameters, 3)) {
                        if (this.DBMgr.Cs.getString(3).trim().equals("1")) {
                            this.DBMgr.DbCommit();
                            result = true;
                        }
                    }
                }
            }
        } catch (Exception Ex) {
            DAO.ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return result;
    }

    public boolean signIn() {
        boolean result = false;
        Object[] parameters;
        String sql;
        try {
            if (this.DBMgr.DbConnect()) {
                {
                    sql = "{ CALL SIGNIN(?, ?, ?) }";

                    // IN 파라미터 만큼만 할당
                    parameters = new Object[2];

                    parameters[0] = signInId;
                    parameters[1] = signInPassword;

                    if (this.DBMgr.RunQuery(sql, parameters, 3, true)) {
                        if (this.DBMgr.Rs.next()) {
                            result = true;
                        }
                    }
                }
            }
        } catch (Exception Ex) {
            DAO.ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return result;
    }


    public boolean withdraw() {
        boolean result = false;
        Object[] parameters;
        String sql;
        try {
            if (this.DBMgr.DbConnect()) {
                {
                    sql = "{ CALL DELETE_USER(?, ?) }";

                    // IN 파라미터 만큼만 할당
                    parameters = new Object[1];

                    parameters[0] = withdrawId;

                    if (this.DBMgr.RunProcedure(sql, parameters, 2)) {
                        if (this.DBMgr.Cs.getString(2).trim().equals("1")) {
                            this.DBMgr.DbCommit();
                            result = true;
                        }
                    }
                }
            }
        } catch (Exception Ex) {
            DAO.ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return result;
    }


    public boolean updatePassword() {
        boolean result = false;
        Object[] parameters;
        String sql;
        try {
            if (this.DBMgr.DbConnect()) {
                {
                    sql = "{ CALL update_password(?, ?, ?) }";

                    // IN 파라미터 만큼만 할당
                    parameters = new Object[2];

                    parameters[0] = updatePasswordId;
                    parameters[1] = updatePassword;

                    int outputIndex = 3;

                    if (this.DBMgr.RunProcedure(sql, parameters, outputIndex)) {
                        if (this.DBMgr.Cs.getString(outputIndex).trim().equals("1")) {
                            this.DBMgr.DbCommit();
                            result = true;
                        }
                    }
                }
            }
        } catch (Exception Ex) {
            DAO.ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return result;
    }

    public boolean selectInSent(String isSent) {
        boolean result = false;
        Object[] parameters;
        String sql;
        try {
            if (this.DBMgr.DbConnect()) {
                {
                    sql = "{ CALL select_user_recommend(?, ?, ?) }";

                    // IN 파라미터 만큼만 할당
                    parameters = new Object[2];

                    parameters[0] = selectId;
                    parameters[1] = isSent;


                    if (this.DBMgr.RunQuery(sql, parameters, 3, true)) {
                        result = true;
                    }
                }
            }
        } catch (Exception Ex) {
            DAO.ExceptionMgr.DisplayException(Ex);        // 예외처리(콘솔)
        }

        return result;
    }


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

                    oPaValue[0] = this.recommendId;

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
}
