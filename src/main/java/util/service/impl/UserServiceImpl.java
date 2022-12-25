package util.service.impl;

import entity.User;
import util.repository.UserRepository;
import util.repository.impl.UserRepositoryImpl;
import util.service.UserService;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public void setSeller(User user) {
        userRepository.setSellerToDB(user);
    }

    @Override
    public void addUser(String login, String password, String nickname) {
        userRepository.addUserToDB(login, password, nickname);
    }

    @Override
    public User getUser(String login, String password) {
        return userRepository.getUserFromDB(login, password);
    }

    @Override
    public User getUserById(long id) {
        return userRepository.getUserByIdFromDB(id);
    }
}
