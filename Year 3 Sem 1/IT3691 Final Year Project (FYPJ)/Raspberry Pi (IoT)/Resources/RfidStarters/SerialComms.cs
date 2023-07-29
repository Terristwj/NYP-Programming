using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Windows.Devices.SerialCommunication;
using Windows.Storage.Streams;  
using Windows.Devices.Enumeration;  
using System.Diagnostics;   

class SerialComms
{
    private SerialDevice serialPort = null;
    DataReader dataReaderObject = null;

    #region Public Event

    public delegate void UartEventDelegate(object sender, UartEventArgs e);

    public event UartEventDelegate UartEvent;

    public class UartEventArgs : EventArgs
    {
        private string _data;

        public string data
        {
            get { return _data; }
            set { _data = value; }
        }
    }

    private void OnUartEvent(UartEventArgs e)
    {
         UartEvent(this, e);
    }
    #endregion

    public SerialComms()
    {
        InitSerial();
    }

    ~SerialComms()
    {
    }

    private async void InitSerial()
    {
        string aqs = SerialDevice.GetDeviceSelector("UART0");
        var myDevices = await DeviceInformation.FindAllAsync(aqs);
        if (myDevices.Count == 0)
            Debug.WriteLine("ERROR - CANNOT Get rpi UART Info");
        else
        {
            DeviceInformation entry = (DeviceInformation)myDevices[0];
            try
            {
                serialPort = await SerialDevice.FromIdAsync(entry.Id);
                if (serialPort == null)
                {
                    Debug.WriteLine("Serial Port is null");
                    return;
                }
                else
                    Debug.WriteLine(serialPort.PortName + " is Ready");
                serialPort.WriteTimeout = TimeSpan.FromMilliseconds(200);
                serialPort.ReadTimeout = TimeSpan.FromMilliseconds(200);
                serialPort.BaudRate = 9600;
                serialPort.Parity = SerialParity.None;
                serialPort.StopBits = SerialStopBitCount.One;
                serialPort.DataBits = 8;
                serialPort.Handshake = SerialHandshake.None;

                Listen();
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Exception in InitSerial: "+ ex.Message.ToString());
            }
        }
    }

    private async void Listen()
    {
        try
        {
            if (serialPort != null)
            {
                dataReaderObject = new DataReader(serialPort.InputStream);

                while (true)
                {
                    await ReadAsync();
                }
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine("EXCEPTION in Listen()");
            Debug.WriteLine("EXCEPTION : " + ex.Message.ToString());
        }
        finally
        {
            // Cleanup once complete
            if (dataReaderObject != null)
            {
                dataReaderObject.DetachStream();
                dataReaderObject = null;
            }
        }
    }

    private async Task ReadAsync()
    {
        Task<UInt32> loadAsyncTask;

        uint ReadBufferLength = 1024;

        dataReaderObject.InputStreamOptions = InputStreamOptions.Partial;
        loadAsyncTask = dataReaderObject.LoadAsync(ReadBufferLength).AsTask();

        UInt32 bytesRead = await loadAsyncTask;
        if (bytesRead > 0)
        {
            string strMsgRec = dataReaderObject.ReadString(bytesRead);
            strMsgRec=strMsgRec.Substring(1, 12);
            UartEventArgs _args = new UartEventArgs();
            _args.data = strMsgRec;
            OnUartEvent(_args);
        }
    }
}
