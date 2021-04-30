namespace HuffmanCode.Algorithm
{
    using System.Collections.Generic;
    using System.IO;
    using System.Reflection;
    using Xunit.Sdk;

    public class AlphabetDataAttribute : DataAttribute
    {
        public AlphabetDataAttribute(string textFilePath)
        {
            this.TextFilePath = textFilePath;
        }

        public string TextFilePath { get; }

        public int SymbolLength { get; set; } = 1;

        public override IEnumerable<object[]> GetData(MethodInfo testMethod)
        {
            yield return new object[]
            {
                File.ReadAllText(this.TextFilePath),
                this.SymbolLength,
            };
        }
    }
}
