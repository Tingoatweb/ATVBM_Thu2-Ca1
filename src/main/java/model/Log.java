package model;

import java.time.LocalDateTime;

public class Log {
    private int id;

    private String level;
    private LocalDateTime createAt;
    private String address;
    private String PreValue;
    private String value;
    private String national;

    public Log(int ip, String level, LocalDateTime createAt, String address, String preValue, String value, String national) {
        this.id = ip;
        this.level = level;
        this.createAt = createAt;
        this.address = address;
        PreValue = preValue;
        this.value = value;
        this.national = national;
    }

    public int getId() {
        return id;
    }

    public String getLevel() {
        return level;
    }

    public LocalDateTime getCreateAt() {
        return java.time.LocalDateTime.now();
    }

    public String getAddress() {
        return address;
    }

    public String getPreValue() {
        return PreValue;
    }

    public String getValue() {
        return value;
    }

    public String getNational() {
        return national;
    }
}
