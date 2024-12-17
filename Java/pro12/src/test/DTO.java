package test;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DTO {

    private Response Response;


    @Data
    @NoArgsConstructor
    public static class Response {
        private String body;
        private String header;

    }

    @Data
    @NoArgsConstructor
    public static class header {
        private String resultMsg;
        private int resultCode;
    }

    @Data
    @NoArgsConstructor
    public static class Body {
        private List<Item> itemList;
    }

    @Data
    @NoArgsConstructor
    public static class Item {
        private int code;
        private String name;
        private int rnum;
    }

	public DAO getBody() {
		return null;
	}
}