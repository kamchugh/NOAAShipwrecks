package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

public class WreckFileDAO implements WreckDAO {
	private static final String FILE_NAME ="/WEB-INF/Shipwrecks_Final.csv";
	
	private  Map<Integer, Wreck> wrecksMap = new HashMap<Integer, Wreck>();
	List<Wreck> wrecksList =
		    new ArrayList<Wreck>(wrecksMap.values());
	
	@Autowired
	private ApplicationContext ac;
	
	@PostConstruct
	public void init() {
		try (
				InputStream is = ac.getResource(FILE_NAME).getInputStream();
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
				) {
			String line = buf.readLine();
			
			while ((line = buf.readLine()) != null) {
				System.out.println(line);
				String[] tokens = line.split(",");
				Integer record = Integer.parseInt(tokens[0]);
				String nameofship = tokens[1];
				String dangerofship = tokens[2];
				String latitute = tokens[3];
				String longitude = tokens[4];
				String depth = tokens[5];
				String yearsunk = tokens[6];
				String history = tokens[7];
				int id = (int)Integer.parseInt(tokens[8]);
				wrecksMap.put(record, new Wreck(record, nameofship, dangerofship, latitute, longitude, depth, yearsunk, history, id));
				System.out.println("Made a wreck");
			}
		} catch (Exception e) {
			System.err.println(e);
		}
		
	}
	
	@Override 
	public Wreck getWreckByName(String name) {
		List<Wreck> wrecksList =
			    new ArrayList<Wreck>(wrecksMap.values());
		Wreck w = null;
		for (Wreck wreck : wrecksList) {
			if (wreck.getNameofship().equals(name)) {
				w = wreck;
				break;
			}
		}
		return w;
	}
	
	// add get wreck by coordinates here!!!!!!!!!
	
	@Override 
	public Wreck getWreckbyId(int id) {
		List<Wreck> wrecksList =
			    new ArrayList<Wreck>(wrecksMap.values());
		Wreck w = null;
		for (Wreck wreck : wrecksList) {
			if (wreck.getId() == id) {
				w = wreck;
				break;
			}
		}
		return w;
	}
	
	public Wreck getWreckbyYearSunk(String yearsunk) {
		List<Wreck> wrecksList =
			    new ArrayList<Wreck>(wrecksMap.values());
		Wreck w = null;
		for (Wreck wreck : wrecksList) {
			if (wreck.getYearsunk().equals(yearsunk)) {
				w = wreck;
				break;
			}
		}
		return w;
	}
	
	public List<Wreck> getWreckbyDanger(String dangerofship) {
		List<Wreck> wrecksList =
			    new ArrayList<Wreck>(wrecksMap.values());
		Wreck w = null;
		List<Wreck> wreckList = new ArrayList<Wreck>();
		for (Wreck wreck : wrecksList) {
			if (wreck.getDangerofship().equals(dangerofship)) {
				w = wreck;
				wreckList.add(w);
			}
		}
		return wreckList;
	}
	
	public Wreck getWreckbyRecord(String record) {
		//System.out.println("in get by record method");
		List<Wreck> wrecksList =
			    new ArrayList<Wreck>(wrecksMap.values());
		Wreck w = null;
		for (Wreck wreck : wrecksList) {
			//System.out.println(wreck.getRecord());
			if (wreck.getRecord().equals(new Integer(record))) {
				w = wreck;
				//System.out.println("Wreck found" + w.getRecord());
				break;
			}
		}
		return w;
	}
	
	public void addWreck(Wreck wreck) {
		wrecksMap.put(wreck.getRecord(), wreck);
	}
	
	public void deleteWreck(Wreck wreck) {
		System.out.println("Made it into the delete method and is deleting:" + wreck.getRecord());
		wrecksMap.remove(wreck.getRecord());  //wrecksMap.remove(wreck.getRecord()
		System.out.println(wrecksMap);
		System.out.println("I've removed:" + wreck.getRecord());
	}
	
	public void updateWreck(Wreck wreck) {
		System.out.println("in update method");
		System.out.println(wreck.toString());
		wrecksMap.put(wreck.getRecord(), wreck);
	}
	
//	public Wreck updateWreck(String record) {
//		System.out.println("in update  method");
//		List<Wreck> wrecksList =
//			    new ArrayList<Wreck>(wrecksMap.values());
//		Wreck w = null;
//		for (Wreck wreck : wrecksList) {
//			System.out.println(wreck.getRecord());
//			if (wreck.getRecord().equals(new Integer(record))) {
//				w = wreck;
//				wrecksMap.put(w.getRecord(), w);
//				System.out.println("Editing has been done" + w.getRecord());
//				break;
//			}
//		}
//		return w;
//	}
	
	public List<Wreck> getAllWrecks() {
		List<Wreck> wrecksList =
			    new ArrayList<Wreck>(wrecksMap.values());
		return wrecksList;
	}
	
}
