package BeansHome;

import DAO.DBOracleMgr;
import DAO.ExceptionMgr;

import java.util.ArrayList;

public class BeanUtilityDTO {

    public DBOracleMgr DBMgr;

    public BeanUtilityDTO() {
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

    public ArrayList<String> getNameByNum(String num, String tableName) throws Exception {
        String[] numArr = null;
        if (num == null || num.isEmpty() || num.equals(" ")) {
            return new ArrayList<>();
        }
        if (tableName.equals("nations")) {
            numArr = num.split(",");
        } else {
            numArr = num.substring(1).split(",");
        }
        ArrayList<String> nameList = new ArrayList<>();
        String sql = "";
        try {
            if (this.DBMgr.DbConnect()) {
                for (int i = 0; i < numArr.length; i++) {
                    sql = "SELECT t.name FROM " + tableName + " t WHERE t.id = " + numArr[i];
                    if (this.DBMgr.RunQuery(sql)) {
                        while (this.DBMgr.Rs.next()) {
                            nameList.add(this.DBMgr.Rs.getString("name"));
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ExceptionMgr.DisplayException(ex);        // 예외처리(콘솔)
        }
        return nameList;
    }


}
