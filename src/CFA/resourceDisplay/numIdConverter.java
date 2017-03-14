package CFA.resourceDisplay;

import java.lang.Math;

public class numIdConverter {
	private int cabinetNum;
	private int componentNum;
	private int unitNum;
	private int deviceNum;
	
	private long cabinetId;
	private long componentId;
	private long unitId;
	private long deviceId;

	public numIdConverter()
	{
	}
	
	public long getCabinetId(int cabn)
	{
		cabinetId=(long) (cabn*Math.pow(2,22));
		return cabinetId;
	}
	
	public long getComponentId(int cabn,int comn)
	{
		componentId=(long) (cabn*Math.pow(2, 22)+comn*Math.pow(2, 17));
		return componentId;
	}
	
	public long getUnitId(int cabn,int comn,int un)
	{
		unitId=(long) (cabn*Math.pow(2, 22)+comn*Math.pow(2, 17)+un*Math.pow(2, 10));
		return unitId;
	}
	
	public long getDeviceId(int cabn,int comn,int un,int dn)
	{
		deviceId=(long) (cabn*Math.pow(2, 22)+comn*Math.pow(2, 17)+un*Math.pow(2, 10)+dn);
		return deviceId;
	}
}
