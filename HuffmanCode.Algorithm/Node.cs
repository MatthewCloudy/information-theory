namespace HuffmanCode.Algorithm
{
    public class Node : IHuffmanTree
    {
        private readonly SymbolMapping symbolMapping = new();

        public Node(IHuffmanTree left, IHuffmanTree right)
        {
            this.Count = left.Count + right.Count;

            foreach (var symbol in left.SymbolMapping.Symbols)
            {
                this.symbolMapping[symbol] = new StringSymbol($"0{left.SymbolMapping[symbol].Value}");
            }

            foreach (var symbol in right.SymbolMapping.Symbols)
            {
                this.symbolMapping[symbol] = new StringSymbol($"1{right.SymbolMapping[symbol].Value}");
            }
        }

        public int Count { get; }

        public ISymbolMapping SymbolMapping => this.symbolMapping;
    }
}
