using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    private string _CustName;
    private string _NRIC;
    private string _Hp;
    private string _Email;
    private string _Gender;
    private string _Notifications;
    private string _BirthdayMonth;

    public Customer()
    {
        this._CustName = null;
        this._NRIC = null;
        this._Hp = null;
        this._Email = null;
    }

    public Customer(string p_CustName, string p_NRIC, string p_Hp, string p_Email, string p_Gender, string p_Notifications, string p_BirthdayMonth)
    {
        this._CustName = p_CustName;
        this._NRIC = p_NRIC;
        this._Hp = p_Hp;
        this._Email = p_Email;
        this._Gender = p_Gender;
        this._Notifications = p_Notifications;
        this._BirthdayMonth = p_BirthdayMonth;
    }

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