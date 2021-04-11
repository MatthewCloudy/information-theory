namespace HuffmanCode.Algorithm
{
    public class Node : IHuffmanTree
    {
        private SymbolMapping symbolMapping = new();

        public Node(IHuffmanTree left, IHuffmanTree right)
        {
            this.Left = left;
            this.Right = right;
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

        public IHuffmanTree Left { get; }

        public IHuffmanTree Right { get; }

        public int Count { get; }

        public ISymbolMapping SymbolMapping => this.symbolMapping;
    }
}
