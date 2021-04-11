namespace HuffmanCode.Algorithm
{
    using System.Collections.Generic;

    public class FixedAlphabet : IAlphabet
    {
        private Dictionary<ISymbol, int> countBySymbol = new();

        public IEnumerable<ISymbol> Symbols => this.countBySymbol.Keys;

        public int this[ISymbol symbol]
        {
            get => this.countBySymbol[symbol];
            set => this.countBySymbol[symbol] = value;
        }
    }
}
