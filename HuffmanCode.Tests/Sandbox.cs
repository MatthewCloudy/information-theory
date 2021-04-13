namespace HuffmanCode.Tests
{
    using System.Collections.Generic;
    using System.IO;
    using System.Threading.Tasks;
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

        [Theory]
        [AlphabetData("chapter1.txt")]
        public async Task Test1(string text, int symbolLength)
        {
            var alphabet = new AlphabetFromText(text, symbolLength);

            var huffmanAlgorithm = new HuffmanAlgorithm();
            var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(alphabet);

            foreach (var symbol in symbolMapping.Symbols)
            {
                this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
            }

            var encoder = new Encoder(symbolMapping, alphabet);
            
            await File.WriteAllLinesAsync("chapter1_encoded_1.txt", new List<string>() { encoder.Encode(text) } );

            throw new System.Exception();
        }

        [Theory]
        [AlphabetData("chapter1_lowercase_without_spaces.txt")]
        public async Task Test2(string text, int symbolLength)
        {
            var alphabet = new AlphabetFromText(text.ToLower(), symbolLength);

            var huffmanAlgorithm = new HuffmanAlgorithm();
            var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(alphabet);

            foreach (var symbol in symbolMapping.Symbols)
            {
                this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
            }

            var encoder = new Encoder(symbolMapping, alphabet);
            
            await File.WriteAllLinesAsync("chapter1_normalized_encoded_1.txt", new List<string>() { encoder.Encode(text.ToLower()) } );

            throw new System.Exception();
        }

        [Theory]
        [AlphabetData("chapter1_lowercase_without_spaces.txt")]
        public async Task Test3(string text, int symbolLength)
        {
            var englishAlphabet = new FixedAlphabet
            {
                [new Symbol("a")] = 8200,
                [new Symbol("b")] = 1500,
                [new Symbol("c")] = 2800,
                [new Symbol("d")] = 4300,
                [new Symbol("e")] = 13000,
                [new Symbol("f")] = 2200,
                [new Symbol("g")] = 2000,
                [new Symbol("h")] = 6100,
                [new Symbol("i")] = 7000,
                [new Symbol("j")] = 150,
                [new Symbol("k")] = 770,
                [new Symbol("l")] = 4000,
                [new Symbol("m")] = 2400,
                [new Symbol("n")] = 6700,
                [new Symbol("o")] = 7500,
                [new Symbol("p")] = 1900,
                [new Symbol("q")] = 95,
                [new Symbol("r")] = 6000,
                [new Symbol("s")] = 6300,
                [new Symbol("t")] = 9100,
                [new Symbol("u")] = 2800,
                [new Symbol("v")] = 980,
                [new Symbol("w")] = 2400,
                [new Symbol("x")] = 150,
                [new Symbol("y")] = 2000,
                [new Symbol("z")] = 74,
            };

            var huffmanAlgorithm = new HuffmanAlgorithm();
            var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(englishAlphabet);

            foreach (var symbol in symbolMapping.Symbols)
            {
                this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
            }

            var encoder = new Encoder(symbolMapping, englishAlphabet);
            
            await File.WriteAllLinesAsync("chapter1_normalized_encoded_english_1.txt", new List<string>() { encoder.Encode(text.ToLower()) } );

            throw new System.Exception();
        }

        // [Theory]
        // [AlphabetData("code.txt")]
        // public async Task Test4(string text, int symbolLength)
        // {
        //     var alphabet = new AlphabetFromText(text, symbolLength);

        //     var huffmanAlgorithm = new HuffmanAlgorithm();
        //     var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(alphabet);

        //     foreach (var symbol in symbolMapping.Symbols)
        //     {
        //         this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
        //     }

        //     var encoder = new Encoder(symbolMapping, alphabet);
            
        //     await File.WriteAllLinesAsync("code_encoded_1.txt", new List<string>() { encoder.Encode(text) } );

        //     throw new System.Exception();
        // }

        // [Theory]
        // [AlphabetData("code.txt")]
        // public async Task Test5(string text, int symbolLength)
        // {
        //     var alphabet = new AlphabetFromText(text, " ");

        //     var huffmanAlgorithm = new HuffmanAlgorithm();
        //     var symbolMapping = huffmanAlgorithm.BuildSymbolMapping(alphabet);

        //     foreach (var symbol in symbolMapping.Symbols)
        //     {
        //         this.testOutputHelper.WriteLine($"{symbol.Value} -> {symbolMapping[symbol].Value}");
        //     }

        //     var encoder = new Encoder(symbolMapping, alphabet);
            
        //     await File.WriteAllLinesAsync("code_encoded_block.txt", new List<string>() { encoder.Encode(text) } );

        //     throw new System.Exception();
        // }
    }
}
