namespace HuffmanCode.Algorithm
{
    public class Leaf : IHuffmanTree
    {
        public Leaf(ISymbol symbol, int count)
        {
            this.Count = count;

            this.SymbolMapping = new SymbolMapping
            {
                [symbol] = new StringSymbol(string.Empty),
            };
        }

        public int Count { get; }

        public ISymbolMapping SymbolMapping { get; }
    }
}
