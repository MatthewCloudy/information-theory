namespace HuffmanCode.Algorithm
{
    public interface IHuffmanTree
    {
        int Count { get; }

        ISymbolMapping SymbolMapping { get; }
    }
}
