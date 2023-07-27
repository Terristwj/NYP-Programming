using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    //private class variables accessible only within this class
    private string _CustName;
    private string _NRIC;
    private string _Hp;
    private string _Email;
    private string _Gender;
    private string _Notifications;
    private string _BirthdayMonth;

    //Empty or Default class constructor
    public Customer()
    {
        this.CustName = null;
        this.NRIC = null;
        this.Hp = null;
        this.Email = null;
    }
    //overloaded class constructor with 4 parameters
    public Customer(string p_CustName, string p_NRIC, string p_Hp, string p_Email,string p_Gender, string p_Notifications, string p_BirthdayMonth)
    {
        this.CustName = p_CustName;
        this.NRIC = p_NRIC;
        this.Hp = p_Hp;
        this.Email = p_Email;
        this.Gender = p_Gender;
        this.Notifications = p_Notifications;
        this.BirthdayMonth = p_BirthdayMonth;
    }

    //public class properties, accessing from outside the class is possible
    public string CustName
    {
        get { return _CustName; }
        set { _CustName = value; }
    }
    public string NRIC
    {
        get { return _NRIC; }
        set { _NRIC = value; }
    }
    public string Hp
    {
        get { return _Hp; }
        set { _Hp = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string Gender
    {
        get { return _Gender; }
        set { _Gender = value; }
    }
    public string Notifications
    {
        get { return _Notifications; }
        set { _Notifications = value; }
    }
    public string BirthdayMonth
    {
        get { return _BirthdayMonth; }
        set { _BirthdayMonth = value; }
    }
}