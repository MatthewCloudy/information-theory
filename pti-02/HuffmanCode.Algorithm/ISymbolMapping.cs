namespace HuffmanCode.Algorithm
{
    using System.Collections.Generic;

    public interface ISymbolMapping
    {
        IEnumerable<ISymbol> Symbols { get; }

        ISymbol this[ISymbol symbol] { get; }
    }
}
