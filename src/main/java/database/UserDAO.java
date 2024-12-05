package database;

import model.User;
import util.PasswordEncryption;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;


public class UserDAO extends AbsDAO<User> {
    private ArrayList<User> data = new ArrayList<>();
    private Map<String, Long> lastFailedLoginMap = new HashMap<>();
    public UserDAO(HttpServletRequest request) {
        super(request);
    }

    public UserDAO() {
    }

    public int creatId() {
        data = selectAll();
        return data.size();
    }

    @Override
    public ArrayList<User> selectAll() {
        ArrayList<User> users = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM users ";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String names = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                User customer = new User(id, username, password, role_id, names, birthday, gt, phoneNumber, email, avatar);


                users.add(customer);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    public User selectByName(String name) {
        User result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM users WHERE name = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id1 = rs.getInt("user_id");
                String usernames = rs.getString("username");
                String passwords = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String nameu = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                result = new User(id1, usernames, passwords, role_id, nameu, birthday, gt, phoneNumber, email, avatar);

            }
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    @Override
    public User selectById(int id) {
        User result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM book.users WHERE user_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id1 = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String name = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                result = new User(id1, username, password, role_id, name, birthday, gt, phoneNumber, email, avatar);
            }
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }
    public ArrayList<User> selectAdmin() {
        ArrayList<User> users = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM users WHERE role_id = 1";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String names = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                User customer = new User(id, username, password, role_id, names, birthday, gt, phoneNumber, email, avatar);


                users.add(customer);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    public ArrayList<User> selectAdminBlock() {
        ArrayList<User> users = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM users WHERE role_id = 5";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String names = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                User customer = new User(id, username, password, role_id, names, birthday, gt, phoneNumber, email, avatar);


                users.add(customer);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    // danh sách toàn bộ user bao gồm khóa và chưa khóa
    public ArrayList<User> selectUserLockAndUnLock() {
        ArrayList<User> users = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM users where role_id = 2 OR role_id = 3";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String names = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                User customer = new User(id, username, password, role_id, names, birthday, gt, phoneNumber, email, avatar);


                users.add(customer);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    public ArrayList<User> selectUser() {
        ArrayList<User> users = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM users where role_id = 2";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String names = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                User customer = new User(id, username, password, role_id, names, birthday, gt, phoneNumber, email, avatar);


                users.add(customer);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    public ArrayList<User> selectAccountLockout() {
        ArrayList<User> users = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM users where role_id = 3";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String names = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                User customer = new User(id, username, password, role_id, names, birthday, gt, phoneNumber, email, avatar);


                users.add(customer);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    public boolean selectByUsername(String username) {

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM users WHERE username =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    // kiểm tra đăng nhập
    public User selectByUsernamePassword(String username, String password) {
        User result = null;
        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM users WHERE username = ? and password=? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id1 = rs.getInt("user_id");
                String usernames = rs.getString("username");
                String passwords = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String name = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String avatar = rs.getString("avatar");
                int failedLogin = rs.getInt("failedLogin");
                result = new User(id1, usernames, passwords, role_id, name, birthday, gt, phoneNumber, email, avatar, failedLogin);
            }
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }if(result==null){
            incrementFailedLoginAttempts(username);
            int failedLoginCount = getFailedLogin(username); // Tăng số lần đăng nhập sai
            this.setValue("Tai khoan " + username + " da dang nhap that bai "+failedLoginCount+" lan");
            super.WARNING(result);
            // khi số lần đăng nhập sai bằng 5
            // khóa tài khoản và ghi log
            // đặt lại thời gian tại khi vừa bị khóa tài khoản
            if (failedLoginCount == 5) {
                startFailedLoginResetTimer(username);
                this.setValue("Tai khoan " + username + " đa bi khoa do đang nhap that bai qua nhieu lan.");
                super.WARNING(result);
            }
        }else{
            int failedLoginCount = getFailedLogin(username);
            // chỉ được đăng nhập nếu tài khoản của bị khóa khi đăng nhập sau lần thứ 5
            if (failedLoginCount < 5) {
            resetFailedLoginAttempts(username);  // Đặt lại số lần đăng nhập sai
            this.setValue("Tai khoan " + username + " da dang nhap thanh cong");
            super.update(result);
            }
        }

        return result;
    }
    // tăng số lần đăng nhập sai
    public void incrementFailedLoginAttempts(String username) {
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "UPDATE users SET failedLogin = failedLogin + 1 WHERE username = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
            JDBCUtil.closeConnection(con);
            int failedLoginCount = getFailedLogin(username);
            long currentTime = System.currentTimeMillis();
            lastFailedLoginMap.put(username, currentTime);
            // Đặt lại số lần đăng nhập thất bại sau 2 tiếng
            // khi số lần đăng nhập sai chưa bị khóa tài khoản thì trong 2 tiếng reset số lần đăng nhập sai
            if (failedLoginCount < 5) {
                startFailedLoginResetTimer(username);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // Đặt lại số đăng nhập sai về 0
    public void resetFailedLoginAttempts(String username) {
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "UPDATE users SET failedLogin = 0 WHERE username = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
            lastFailedLoginMap.remove(username);
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // lấy số lần đăng nhập thất bại của user
    public int getFailedLogin(String username) {
        int failedLogin = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT failedLogin FROM users WHERE username = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                failedLogin = rs.getInt("failedLogin");
            }
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return failedLogin;
    }
    // đặt lại số lần đăng nhập sai trong 2 tiếng
    private void startFailedLoginResetTimer(String username) {
        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                long currentTime = System.currentTimeMillis();
                long lastFailedLoginTime = lastFailedLoginMap.getOrDefault(username, 0L);
                // Nếu đã qua 2 tiếng kể từ lần đăng nhập thất bại cuối cùng
                if (currentTime - lastFailedLoginTime >= 2 * 60 * 60 * 1000) {  // 2 tiếng
                    resetFailedLoginAttempts(username);
                }
            }
        }, 2 * 60 * 60 * 1000);  // 2 tiếng
    }
    public boolean selectByEmail(String email) {

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM users WHERE email =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public User selectByEmail2(String email) {
        User result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id = rs.getString("user_id");
                int id1 = rs.getInt("user_id");
                String usernames = rs.getString("username");
                String passwords = rs.getString("password");
                int role_id = rs.getInt("role_id");
                String name = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String gt = rs.getString("sexual");
                String phoneNumber = rs.getString("phoneNumber");
                String emails = rs.getString("email");
                String avatar = rs.getString("avatar");
                result = new User(id1, usernames, passwords, role_id, name, birthday, gt, phoneNumber, emails, avatar);
                return result;

            }
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(User user) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO book.users(user_id, username, password,role_id,name, birthday, sexual, phoneNumber, email, avatar)"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, user.getUserId());
            rs.setString(2, user.getUsername());

            String passwordS = PasswordEncryption.toSHA1(user.getPassword());

            rs.setString(3, passwordS);
            rs.setInt(4, user.getRole());
            rs.setString(5, user.getName());
            rs.setDate(6, user.getBirthday());
            rs.setString(7, user.getSexual());
            rs.setString(8, user.getPhone());
            rs.setString(9, user.getEmail());
            rs.setString(10, user.getAvatar());

            result = rs.executeUpdate();
            int x=super.insert(user);
            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return result;


    }


    @Override
    public int insertAll(ArrayList<User> list) {
        int result = 0;
        for (User customer : list) {

            ;
            if (this.insert(customer) == 1)
                result += 1;
        }
        return result;

    }

    @Override
    public int delete(User user) {
        int result = 0;
        this.setValue(this.gson.toJson(user));
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from users " + "WHERE user_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, user.getUserId());

            result = rs.executeUpdate();

            int x = super.delete(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @Override
    public int deleteAll(ArrayList<User> list) {
        int result = 0;

        for (User user : list) {
            result += delete(user);
        }
        return result;

    }

    @Override
    public int update(User user) {
        int result = 0;

        User oldUser = this.selectById(user.getUserId());
        //Set gia tri cho json
        this.setValue(this.gson.toJson(user));
        this.setPreValue(this.gson.toJson(oldUser));
        if (oldUser != null) {
            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE book.users SET  username=? " + ", password=? " + ", role_id=?" + ", name=? " + ", birthday=? "
                        + ", sexual=? " + ", phoneNumber=? " + ", email=? " + ", avatar=? " + "WHERE user_id =?";

                PreparedStatement rs = con.prepareStatement(sql);
                rs.setString(1, user.getUsername());
                rs.setString(2, user.getPassword());


                rs.setInt(3, user.getRole());
                rs.setString(4, user.getName());
                rs.setDate(5, user.getBirthday());
                rs.setString(6, user.getSexual());
                rs.setString(7, user.getPhone());
                rs.setString(8, user.getEmail());
                rs.setString(9, user.getAvatar());
                rs.setInt(10, user.getUserId());

                result = rs.executeUpdate();
                super.update(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;

    }
    //cap nhat lai role cua tai khoan
    // dung lam thang cap nhan vien hay khoa tai khoan user
    public int updateRole(User user) {
        int result = 0;

        User oldUser = this.selectById(user.getUserId());
        //Set gia tri cho json
        this.setValue(this.gson.toJson(user));
        this.setPreValue(this.gson.toJson(oldUser));
        if (oldUser != null) {
            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE book.users SET  role_id=? WHERE user_id =?";

                PreparedStatement rs = con.prepareStatement(sql);
                rs.setInt(1, user.getRole());
                rs.setInt(2, user.getUserId());

                result = rs.executeUpdate();
                super.update(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;

    }
    public int updateAvatar(User user) {
        int result = 0;

        User oldUser = this.selectById(user.getUserId());
        //Set gia tri cho json
        this.setValue(this.gson.toJson(user));
        this.setPreValue(this.gson.toJson(oldUser));
        if (oldUser != null) {
            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE book.users SET  avatar=? WHERE user_id =?";

                PreparedStatement rs = con.prepareStatement(sql);
                rs.setString(1, user.getAvatar());
                rs.setInt(2, user.getUserId());

                result = rs.executeUpdate();
                super.update(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;

    }
}

