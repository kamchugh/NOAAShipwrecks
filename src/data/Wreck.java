package data;

public class Wreck {
	private Integer rec;
	private String name;
	private String danger;
	private String lat;
	private String lon;
	private String dep;
	private String yrsunk;
	private String his;
	private int id;
	
	
	public Wreck() {
		
	}

	public Wreck(Integer record, String nameofship, String dangerofship, String latitute, String longitude, String depth,
			String yearsunk, String history, int id) {
		super();
		this.rec = record;
		this.name = nameofship;
		this.danger = dangerofship;
		this.lat = latitute;
		this.lon = longitude;
		this.dep = depth;
		this.yrsunk = yearsunk;
		this.his = history;
		this.id = id;
		
	}

	public Integer getRecord() {
		return rec;
	}

	public void setRecord(Integer record) {
		this.rec = record;
	}

	public String getNameofship() {
		return name;
	}

	public void setNameofship(String nameofship) {
		this.name = nameofship;
	}

	public String getDangerofship() {
		return danger;
	}

	public void setDangerofship(String dangerofship) {
		this.danger = dangerofship;
	}

	public String getLatitute() {
		return lat;
	}

	public void setLatitute(String latitute) {
		this.lat = latitute;
	}

	public String getLongitude() {
		return lon;
	}

	public void setLongitude(String longitude) {
		this.lon = longitude;
	}

	public String getDepth() {
		return dep;
	}

	public void setDepth(String depth) {
		this.dep = depth;
	}

	public String getYearsunk() {
		return yrsunk;
	}

	public void setYearsunk(String yearsunk) {
		this.yrsunk = yearsunk;
	}

	public String getHistory() {
		return his;
	}

	public void setHistory(String history) {
		this.his = history;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Wreck [rec=" + rec + ", name=" + name + ", danger=" + danger + ", lat=" + lat + ", lon=" + lon
				+ ", dep=" + dep + ", yrsunk=" + yrsunk + ", his=" + his + ", id=" + id + "]";
	}

	


}
