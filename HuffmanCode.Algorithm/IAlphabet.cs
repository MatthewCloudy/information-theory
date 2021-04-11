namespace HuffmanCode.Algorithm
{
    using System.Collections.Generic;

    public interface IAlphabet
    {
        IEnumerable<ISymbol> Symbols { get; }

        int this[ISymbol symbol] { get; }
    }
}
