package ua.in.sydoruk.model;

import java.util.Date;

public class User {
    private String firstName;
    private String lastName;
    private Date birthday;
    private String phoneNumber;
    private String email;
    private String country;
    private String region;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    List<User> users = userService.getUsers(currentPage, nameForSearch);
    lastPage = userService.getThePageNumber(nameForSearch);
        modelAndView.addObject("users", users);
        modelAndView.addObject("first", "Перша");
        modelAndView.addObject("last", "Остання");
        modelAndView.addObject("prev", currentPage != 0 ? "Попередня" : "");
        modelAndView.addObject("current", currentPage);
    int startPage = currentPage - 5 > 0 ? currentPage - 5 : 1;

    int endPage = startPage + 9;
        if (endPage > lastPage) {
        endPage = lastPage;
    }
        modelAndView.addObject("startPage", startPage);
        modelAndView.addObject("endPage", endPage);
        modelAndView.addObject("number", lastPage);
        modelAndView.addObject("next", currentPage < lastPage - 1 ? "Наступна" : "");
        modelAndView.addObject("nameReturn", nameForSearch);
        modelAndView.addObject("reset", (nameForSearch.length() != 0) ? " " : "");
}
