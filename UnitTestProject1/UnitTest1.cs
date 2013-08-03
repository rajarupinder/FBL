using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
 
namespace UnitTestProject1
{
    [TestFixture]
    public class UnitTest1
    {
        [TestCase]
        public void NUnitT()
        {
            int length = 10;
            int breadth = 45;
            int area = length * breadth;
            NUnit.Framework.Assert.AreEqual(area, 450); 
        }
    }
}
