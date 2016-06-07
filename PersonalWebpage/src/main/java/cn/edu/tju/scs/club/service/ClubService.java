package cn.edu.tju.scs.club.service;

import cn.edu.tju.scs.club.domain.Club;
import cn.edu.tju.scs.club.domain.User;

import java.util.List;

/**
 * Club Service
 * Created by jack on 2016/3/26.
 */
public interface ClubService {

    public List<Club> getAllClub();

    public void addClub(Club club);

    public Club findClubByUser(User user);

    public void updateClub(Club club);

    public Club getClub(int id);

    public void deleteById(int id);

    public List<Club> getAllClubType(Integer type);
}
