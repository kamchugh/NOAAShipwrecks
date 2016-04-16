package data;

import java.util.List;
import java.util.Map;

public interface WreckDAO {
	public Wreck getWreckByName(String name);
	//public Wreck getWreckByCoordinates(String latitue, String longitude); - save this for later
	public void addWreck(Wreck wreck);
	public void deleteWreck(Wreck wreck);
	public Wreck getWreckbyId(int id);
	public Wreck getWreckbyYearSunk(String yearsunk);
	public List<Wreck> getAllWrecks();
	public List<Wreck> getWreckbyDanger(String danger);
	public Wreck getWreckbyRecord(String record);
	public void updateWreck(Wreck wreck);
	
}
