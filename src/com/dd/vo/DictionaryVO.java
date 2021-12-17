package com.dd.vo;

public class DictionaryVO {
	private String file_name;
	private String variety;
	private String height;
	private String weight;
	private String color;
	private String lifespan;
	private String content;
	private String ancestry;
	
	public DictionaryVO() { }

	public DictionaryVO(String file_name, String variety, String height, String weight, String color, String lifespan,
			String content, String ancestry) {
		this.file_name = file_name;
		this.variety = variety;
		this.height = height;
		this.weight = weight;
		this.color = color;
		this.lifespan = lifespan;
		this.content = content;
		this.ancestry = ancestry;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getVariety() {
		return variety;
	}

	public void setVariety(String variety) {
		this.variety = variety;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getLifespan() {
		return lifespan;
	}

	public void setLifespan(String lifespan) {
		this.lifespan = lifespan;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAncestry() {
		return ancestry;
	}

	public void setAncestry(String ancestry) {
		this.ancestry = ancestry;
	}

	@Override
	public String toString() {
		return "DictionaryVO [file_name=" + file_name + ", variety=" + variety + ", height=" + height + ", weight="
				+ weight + ", color=" + color + ", lifespan=" + lifespan + ", content=" + content + ", ancestry="
				+ ancestry + "]";
	}


}
