/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gr.athtech.mis.web;

import gr.athtech.mis.model.PaidVisit;
import gr.athtech.mis.model.ScheduledVisit;
import gr.athtech.mis.service.PaidVisitService;
import gr.athtech.mis.service.ScheduledVisitService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author JurgenPC
 */
@Controller
@RequestMapping(value = "/PaidVisits")
public class PaidVisitController {
    
    private final Logger logger = LoggerFactory.getLogger(PaidVisitController.class);
    
    @Autowired
    private PaidVisitService paidVisitService;
    @Autowired 
    private ScheduledVisitService scheduledVisitService;
    
    /**
     * Return the view that will display all the paid visits
     *
     * @param model
     * @return
     */
     @RequestMapping(value = "/", method = RequestMethod.GET)
     public String index(Map<String, Object> model){
         
         List<PaidVisit> paidVisits = paidVisitService.findAll();
         logger.debug("------------------NEW VISITS");
         model.put("paidVisits", paidVisits);
         return "paidVisits/view";    
     }
     
     /**
     * Return the view that will display all the paid visits of the logged in user
     *
     * @param id
     * @param model
     * @return
     */
     @RequestMapping(value = "/{id}", method = RequestMethod.GET)
     public String indexSingle(@PathVariable("id") Long id, Map<String, Object> model){
         
         List<ScheduledVisit> userVisits = scheduledVisitService.getAllByVisitorId(id);
         List<PaidVisit> paidVisits = paidVisitService.getAllPaidVisits(userVisits);
         logger.debug("------------------NEW VISITS");
         model.put("paidVisits", paidVisits);
         return "paidVisits/view";    
     }
     
     /**
     * Return the view that holds the edit scheduled visit form
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/create/{id}", method = RequestMethod.GET)
    public String create(@PathVariable("id") Long id, Model model) {

        ScheduledVisit schv = scheduledVisitService.findById(id);
        model.addAttribute("schv", schv);
        return "paidVisits/create";
    }
    
    @RequestMapping(value = "/store", method = RequestMethod.POST)
    public String store(HttpServletRequest request, HttpServletResponse response, Model model) throws ParseException {

        ScheduledVisit selectedSchv = scheduledVisitService.findById(Long.parseLong(request.getParameter("id")));
        
        //Convert date parammeter to SQL date
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date date = format.parse(request.getParameter("date"));
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        
        //store paid visit in the database
        PaidVisit pdvst = new PaidVisit();
        pdvst.setWeek(request.getParameter("week"));
        pdvst.setHour(request.getParameter("hour"));
        pdvst.setIsGroup(request.getParameter("group"));
        pdvst.setDate(sqlDate);
        pdvst.setComments(request.getParameter("comment"));
        pdvst.setScheduledVisit(selectedSchv);
        
        logger.debug("----- New user: ", pdvst);

        paidVisitService.save(pdvst);
        return "redirect:/PaidVisits/";
    }
    
    @RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
    public String info(@PathVariable("id") Long id, Model model) {

        PaidVisit paidVisit = paidVisitService.findById(id);
        model.addAttribute("paidVisit", paidVisit);
        return "paidVisits/info";
    }
    
    
     
     
    
}
