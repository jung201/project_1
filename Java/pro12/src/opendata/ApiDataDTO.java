package opendata;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ApiDataDTO {

    private ComMsgHeader comMsgHeader;
    private MsgHeader msgHeader;
    private MsgBody msgBody;


    @Data
    @NoArgsConstructor
    public static class ComMsgHeader {
        private String errMsg;
        private String responseTime;
        private String requestMsgID;
        private String responseMsgID;
        private String successYN;
        private String returnCode;
    }

    @Data
    @NoArgsConstructor
    public static class MsgHeader {
        private String headerMsg;
        private int headerCd;
        private int itemCount;
    }

    @Data
    @NoArgsConstructor
    public static class MsgBody {
        private List<Item> itemList;
    }

    @Data
    @NoArgsConstructor
    public static class Item {

        private int arsId;
        private String beginTm;
        private int busRouteAbrv;
        private String busRouteId;
        private String busRouteNm;
        private String direction;
        private String fullSectDist;
        private String gpsX;
        private String gpsY;
        private String lastTm;
        private String posX;
        private String posY;
        private String routeType;
        private String sectSpd;
        private String section;
        private int seq;
        private String station;
        private String stationNm;
        private String stationNo;
        private String transYn;
        private String trnstnid;

    }
}