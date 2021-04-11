namespace HuffmanCode.Algorithm
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class AlphabetFromText : IAlphabet
    {
        private readonly Dictionary<ISymbol, int> countBySymbol;

        public AlphabetFromText(string text, int symbolLength)
        {
            if (text.Length % symbolLength != 0)
            {
                throw new InvalidOperationException();
            }

            this.countBySymbol = text
                            .Select((character, index) => (Character: character, Index: index))
                            .GroupBy(x => x.Index / symbolLength, x => x.Character)
                            .Select(x => new string(x.ToArray()))
                            .GroupBy(s => s)
                            .ToDictionary(x => new StringSymbol(x.Key) as ISymbol, x => x.Count());
        }

        public IEnumerable<ISymbol> Symbols => this.countBySymbol.Keys;

        public int this[ISymbol symbol]
        {
            get => this.countBySymbol[symbol];
            set => this.countBySymbol[symbol] = value;
        }
    }
}
