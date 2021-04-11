namespace HuffmanCode.Algorithm
{
    using System.Linq;

    public class HuffmanAlgorithm : IHuffmanAlgorithm
    {
        public ISymbolMapping BuildSymbolMapping(IAlphabet alphabet)
        {
            var huffmanTrees = alphabet.Symbols.Select(s => new Leaf(s, alphabet[s]) as IHuffmanTree).ToList();

            while (huffmanTrees.Count > 1)
            {
                var huffmanTreesToMerge =
                    huffmanTrees
                        .OrderBy(t => t.Count)
                        .Select((tree, index) => (Tree: tree, IsMerged: index < 2))
                        .ToLookup(x => x.IsMerged, x => x.Tree);

                huffmanTrees =
                    huffmanTreesToMerge[false].Append(new Node(huffmanTreesToMerge[true].First(), huffmanTreesToMerge[true].ElementAt(1))).ToList();
            }

            return huffmanTrees.Single().SymbolMapping;
        }
    }
}
