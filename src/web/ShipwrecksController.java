package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.Wreck;
import data.WreckDAO;

@Controller
@SessionAttributes("current")
public class ShipwrecksController {

	@Autowired
	private WreckDAO wreckDao;
	private Wreck wreck;

	@ModelAttribute("current")
	public Integer initSessionObject() {
		return 1;
	}

	@RequestMapping("getAllShipwrecks.do") // this gets all the shipwrecks in
											// the database
	public ModelAndView getAllShipwrecks() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allShips.jsp");
		mv.addObject("wrecks", wreckDao.getAllWrecks());
		return mv;
	}


	@RequestMapping("getByCategory.do") // this gets all the shipwrecks in the
										// database by category. You get a list.
	public ModelAndView getVisibleShipwrecks(@RequestParam("name") String a) {
		System.out.println(a);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("allShips.jsp");
		mv.addObject("wrecks", wreckDao.getWreckbyDanger(a));
		return mv;

	}

	@RequestMapping("getByRecord.do") 
	public ModelAndView getShipwreckbyRecord(@RequestParam("name") String a) {
		System.out.println("Record is" + a);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("wreck", wreckDao.getWreckbyRecord(a));

		return mv;
	}
// this creates a new shipwreck
	@RequestMapping(path = "newShipwreck.do", method = RequestMethod.POST)
	public ModelAndView newWreck(Wreck wreck) {
		System.out.println("Got here");
		wreckDao.addWreck(wreck);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		return mv;
	}
// this saves your edited shipwreck
	@RequestMapping(path="saveEditedShipwreck.do", method = RequestMethod.POST) // this saves the shipwreck to your database (hopefully!)
	public ModelAndView SaveEditedShipwreck(Wreck wreck) {
		System.out.println("In the controller:" + wreck.toString());
		wreckDao.updateWreck(wreck);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		return mv;
	}
// this deletes your shipwreck
	@RequestMapping(path = "deleteShipwreck.do")
	public ModelAndView deleteWreck(Wreck wreck) {
		System.out.println("Got here");
		wreckDao.deleteWreck(wreck);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deleted.html");
		return mv;
	}
// this brings up the form for you to edit your shipwreck
	@RequestMapping("editShipwreck.do") 
	public ModelAndView updateShipwreckbyRecord(@RequestParam("name") String a) {
		//System.out.println(a);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editShipwreck.jsp");
		mv.addObject("wreck", wreckDao.getWreckbyRecord(a));
		return mv;
	}
// gets a ship of a specific record number, used on the bottom of the index page
	@RequestMapping(path="SearchShipwrecks.do", 
			params="record",
			method=RequestMethod.GET)
	public ModelAndView getByRecordNumber(@RequestParam("record") String n) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("wreck", wreckDao.getWreckbyRecord(n));
		return mv;
	}
	
// search by ship name
	@RequestMapping(path="SearchShipwrecksByName.do", 
			params="nameofship",
			method=RequestMethod.GET)
	public ModelAndView getByRecordName(@RequestParam("nameofship") String n) {
		System.out.println("I get into the name method with: " + n);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("wreck", wreckDao.getWreckByName(n));
		return mv;
	}
	
	// search by year
		@RequestMapping(path="SearchShipwrecksByYear.do", 
				params="yearsunk",
				method=RequestMethod.GET)
		public ModelAndView getByYearSunk(@RequestParam("yearsunk") String n) {
			System.out.println("I get into the year method with: " + n);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("result.jsp");
			mv.addObject("wreck", wreckDao.getWreckbyYearSunk(n));
			return mv;
		}
}
