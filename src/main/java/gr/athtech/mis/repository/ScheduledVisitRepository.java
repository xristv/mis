/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gr.athtech.mis.repository;

import gr.athtech.mis.model.Cycle;
import gr.athtech.mis.model.ScheduledVisit;
import gr.athtech.mis.model.User;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Uses the methods of the IScheduledVisitRepository interface
 * @author jmone
 */
@Service("scheduledVisitRepository")
public class ScheduledVisitRepository {

    private static final Logger logger = LoggerFactory.getLogger(ScheduledVisit.class);

    @Resource
    IScheduledVisitRepository repo;
    @Resource
    UserRepository userRepo;
    @Resource
    ICycleRepository cycleRepo;

    /**
     * Find all scheduled visits
     * 
     * @return List<ScheduledVisit>
     */
    public List<ScheduledVisit> findAll() {
        List<ScheduledVisit> newVisits = repo.findAll();
        return newVisits;
    }

    /**
     * Save a scheduled visit 
     * 
     * @param schvst
     * @return ScheduledVisit
     */
    public ScheduledVisit save(ScheduledVisit schvst) {
        schvst = repo.save(schvst);
        return schvst;
    }

    /**
     * Find a scheduled visit based on a given id
     * 
     * @param schvst
     * @return ScheduledVisit
     */
    public ScheduledVisit findById(Long id) {

        ScheduledVisit schv = repo.findOne(id);

        return schv;
    }

    /**
     * Delete a scheduled visit based on Id
     *
     * @param id
     */
    public void delete(Long id) {
        repo.delete(id);
    }

    public List<ScheduledVisit> findByMedicalVisitors(User user) {
        return repo.findByMedicalVisitors(user);
    }

    public List<ScheduledVisit> findByMedicalVisitorId(Long id) {
        List<ScheduledVisit> allVisits = repo.findByMedicalVisitorId(id);

        return allVisits;
    }

    public List<ScheduledVisit> getUsersFromCurrentCycle(Long id) {
        List<ScheduledVisit> activeVisits = repo.findByMedicalVisitorId(id);
        return activeVisits;
    }

    public List<ScheduledVisit> getGroupsFromCurrentCycle(Long id) {
        List<ScheduledVisit> activeGroupVisits = repo.findByGroupId(id);
        return activeGroupVisits;
    }

    public List<ScheduledVisit> showByCurrentCycle() {
        List<ScheduledVisit> allCurrentVisits = repo.findByCurrentCycle();
        return allCurrentVisits;
    }

    public List<ScheduledVisit> findByMemberAndLeader(Long id) {
        List<ScheduledVisit> bothVisits = repo.findByGroupLeaderAndId(id);

        return bothVisits;
    }

    public List<ScheduledVisit> showVisitsByCycleId(Long id) {
        Cycle cycle = cycleRepo.findOne(id);
        List<ScheduledVisit> selectedList = repo.findScheduledVisitByCycle(cycle);

        return selectedList;
    }

    //For doctor's view
    public List<ScheduledVisit> showScheduledVisitsByDoctorId(Long id) {
        List<ScheduledVisit> selectedDoctorList = repo.findScheduledVisitsByDoctor(id);

        return selectedDoctorList;
    }

    //members view
    public List<ScheduledVisit> findRelatedMembersId(Long id) {
        List<ScheduledVisit> memberVisits = repo.findByMemberID(id);

        return memberVisits;
    }
    
    //REPORTS------------------------------------------------------------------
    
    //REPORT2 - Individual
    public List<ScheduledVisit> showVisitsByCycleAndUserId(Long userId, Long cycleId) {
        List<ScheduledVisit> selectedList = repo.findScheduledVisitByUserAndCycle(userId, cycleId);

        return selectedList;
    }
    
    //REPORT2 - Group
    public List<ScheduledVisit> showGroupVisitsByCycleAndUserId(Long userId, Long cycleId) {
        List<ScheduledVisit> selectedGroupList = repo.findScheduledVisitByGroupAndCycle(userId, cycleId);

        return selectedGroupList;
    }
}
