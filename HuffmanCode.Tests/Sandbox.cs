namespace HuffmanCode.Tests
{
    using HuffmanCode.Algorithm;
    using Xunit;
    using Xunit.Abstractions;

    public class Sandbox
    {
        private ITestOutputHelper testOutputHelper;

        public Sandbox(ITestOutputHelper testOutputHelper)
        {
            this.testOutputHelper = testOutputHelper;
        }

        [Fact]
        public void Test1()
        {
            var alphabet = new FixedAlphabet
            {
                [new CharacterSymbol('O')] = 4,
                [new CharacterSymbol('B')] = 2,
                [new CharacterSymbol('N')] = 1,
                [new CharacterSymbol('R')] = 1,
                [new CharacterSymbol(' ')] = 5,
                [new CharacterSymbol('E')] = 2,
                [new CharacterSymbol('T')] = 3,
            };

            var huffmanAlgorithm = new HuffmanAlgorithm();
            var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(alphabet);

            foreach (var symbol in symbolMapping.Symbols)
            {
                this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
            }

            throw new System.Exception();
        }

        [Theory]
        [AlphabetData("szekspir.txt", SymbolLength = 2)]
        public void Test2(string text, int symbolLength)
        {
            var alphabet = new AlphabetFromText(text, symbolLength);

            var huffmanAlgorithm = new HuffmanAlgorithm();
            var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(alphabet);

            foreach (var symbol in symbolMapping.Symbols)
            {
                this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
            }

            throw new System.Exception();
        }
    }
}
