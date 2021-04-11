namespace HuffmanCode.Algorithm
{
    public class Leaf : IHuffmanTree
    {
        public Leaf(ISymbol symbol, int count)
        {
            this.Symbol = symbol;
            this.Count = count;

            this.SymbolMapping = new SymbolMapping
            {
                [this.Symbol] = new StringSymbol(string.Empty),
            };
        }

        public ISymbol Symbol { get; }

        public int Count { get; }

        public ISymbolMapping SymbolMapping { get; }
    }
}
