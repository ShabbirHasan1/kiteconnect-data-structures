package Profile;

import com.fasterxml.jackson.annotation.*;

public class Data {
    private Object avatarURL;
    private String broker;
    private String email;
    private String[] exchanges;
    private Meta meta;
    private String[] orderTypes;
    private String[] products;
    private String userID;
    private String userName;
    private String userShortname;
    private String userType;

    @JsonProperty("avatar_url")
    public Object getAvatarURL() { return avatarURL; }
    @JsonProperty("avatar_url")
    public void setAvatarURL(Object value) { this.avatarURL = value; }

    @JsonProperty("broker")
    public String getBroker() { return broker; }
    @JsonProperty("broker")
    public void setBroker(String value) { this.broker = value; }

    @JsonProperty("email")
    public String getEmail() { return email; }
    @JsonProperty("email")
    public void setEmail(String value) { this.email = value; }

    @JsonProperty("exchanges")
    public String[] getExchanges() { return exchanges; }
    @JsonProperty("exchanges")
    public void setExchanges(String[] value) { this.exchanges = value; }

    @JsonProperty("meta")
    public Meta getMeta() { return meta; }
    @JsonProperty("meta")
    public void setMeta(Meta value) { this.meta = value; }

    @JsonProperty("order_types")
    public String[] getOrderTypes() { return orderTypes; }
    @JsonProperty("order_types")
    public void setOrderTypes(String[] value) { this.orderTypes = value; }

    @JsonProperty("products")
    public String[] getProducts() { return products; }
    @JsonProperty("products")
    public void setProducts(String[] value) { this.products = value; }

    @JsonProperty("user_id")
    public String getUserID() { return userID; }
    @JsonProperty("user_id")
    public void setUserID(String value) { this.userID = value; }

    @JsonProperty("user_name")
    public String getUserName() { return userName; }
    @JsonProperty("user_name")
    public void setUserName(String value) { this.userName = value; }

    @JsonProperty("user_shortname")
    public String getUserShortname() { return userShortname; }
    @JsonProperty("user_shortname")
    public void setUserShortname(String value) { this.userShortname = value; }

    @JsonProperty("user_type")
    public String getUserType() { return userType; }
    @JsonProperty("user_type")
    public void setUserType(String value) { this.userType = value; }
}
