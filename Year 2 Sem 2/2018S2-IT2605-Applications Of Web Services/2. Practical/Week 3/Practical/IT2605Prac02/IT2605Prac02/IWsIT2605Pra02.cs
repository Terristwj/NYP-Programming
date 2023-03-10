using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace IT2605Prac02
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IWsIT2605Pra02" in both code and config file together.
    [ServiceContract]
    public interface IWsIT2605Pra02
    {
        [OperationContract]
        string HelloWorld(string username);

        [OperationContract]
        Student GetStudent(int id);
    }
}
