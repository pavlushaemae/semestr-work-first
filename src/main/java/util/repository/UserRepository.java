package util.repository;

import entity.User;

public interface UserRepository {
    void setSellerToDB(User user);
    void addUserToDB(String login, String password, String nickname);
    User getUserFromDB(String login, String password);
    User getUserByIdFromDB(long id);
}
