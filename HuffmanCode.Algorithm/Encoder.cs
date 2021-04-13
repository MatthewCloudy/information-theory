namespace HuffmanCode.Algorithm
{
    using System.Linq;

    public class Encoder
    {
        public Encoder(ISymbolMapping symbolMapping, IAlphabet alphabet)
        {
            this.SymbolMapping = symbolMapping;
            this.Alphabet = alphabet;
        }

        public ISymbolMapping SymbolMapping { get; }

        public IAlphabet Alphabet { get; }

        public string Encode(string text)
        {
            string encodedText;
            int symbolLength = this.Alphabet.Symbols.First().Value.Length;
            encodedText = symbolLength == 1
                ? text.Select(c => this.SymbolMapping[new Symbol(c.ToString())].Value).Aggregate((x, y) => x + y)
                : text
                    .Select((character, index) => (Character: character, Index: index))
                    .GroupBy(x => x.Index / symbolLength, x => x.Character)
                    .Select(x => new string(x.ToArray()))
                    .Select(s => this.SymbolMapping[new Symbol(s)].Value).Aggregate((x, y) => x + y);
            return encodedText;
        }
    }
}
