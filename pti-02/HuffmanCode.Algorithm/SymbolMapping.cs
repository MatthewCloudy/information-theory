namespace HuffmanCode.Algorithm
{
    using System.Collections.Generic;

    public class SymbolMapping : ISymbolMapping
    {
        private Dictionary<ISymbol, ISymbol> mapping = new();

        public IEnumerable<ISymbol> Symbols => this.mapping.Keys;

        public ISymbol this[ISymbol symbol]
        {
            get => this.mapping[symbol];
            set => this.mapping[symbol] = value;
        }
    }
}
